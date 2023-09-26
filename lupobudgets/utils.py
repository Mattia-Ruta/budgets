from forex_python.converter import CurrencyCodes, CurrencyRates
from lupobudgets.translations import Translations
from deep_translator import GoogleTranslator
import logging
import mapcode as mc


class Currency:
    currency_codes = CurrencyCodes()
    currency_rates = CurrencyRates()

    choices = [
        ("AUD", "[AUD] Australian Dollar"),
        ("BGN", "[BGN] Bulgarian Lev"),
        ("BRL", "[BRL] Brazilian Real"),
        ("CAD", "[CAD] Canadian Dollar"),
        ("CNY", "[CNY] Chinese Yuan"),
        ("CHF", "[CHF] Swiss Franc"),
        ("CZK", "[CZK] Czech Koruna"),
        ("DKK", "[DKK] Danish Krone"),
        ("EUR", "[EUR] Euro"),
        ("GBP", "[GBP] Pound Sterling"),
        ("HUF", "[HUF] Hungarian Forint"),
        ("IDR", "[IDR] Indonesian Rupiah"),
        ("JPY", "[JPY] Japanese Yen"),
        ("MYR", "[MYR] Malaysian Ringgit"),
        ("NOK", "[NOK] Norwegian Krone"),
        ("NZD", "[NZD] New Zealand Dollar"),
        ("PLN", "[PLN] Polish Złoty"),
        ("RON", "[RON] Romanian Leu"),
        ("SEK", "[SEK] Swedish Krona"),
        ("SGD", "[SGD] Singapore Dollar"),
        ("TRY", "[TRY] Turkish Lira"),
        ("USD", "[USD] US Dollar"),
    ]

    def __init__(self, code: str = "GBP") -> None:
        for set in self.choices:
            if set[0] == code:
                self.code = code
                self.name = set[1]
                self.symbol = self.currency_codes.get_symbol(code)
                return

    def get_name(self, lang="en", request = None) -> str:
        """Prints name for displaying in template"""
        session_key = f"currency_name_{lang}_{self.code}"
        if lang == "en" and self.code == "GBP":
            return "Pound Sterling"
        
        try:
            translation = GoogleTranslator("en", lang).translate(self.name)
            if request:
                request.session[session_key] = translation
                return translation
        except Exception as e:
            logger = logging.getLogger(__name__)
            logger.warning(f"Translation not found for: {self.name} - {e}")
            return self.name

#Translations.translate(self.currency_codes.get_currency_name(self.code), lang)
        return 
    
    def convert(self, amount: float, code: str = "GBP") -> float:
        """Attempts to convert to given currency"""
        logger = logging.getLogger(__name__)
        try:
            return round(self.currency_rates.convert(self.code, code, amount), 2)
        except Exception as e:
            logger.warning(f"Failed to convert currency {self.code} -> {code}: {e}")


class Mapcode:
    def __init__(self, mapcode: str = "", latlong: tuple = None) -> None:
        if len(mapcode) > 0:
            self.mapcode = mapcode
        if latlong:
            self.latlong = latlong
        self.mc = mc
    
    def set_mapcode(self, latlong: tuple) -> bool:
        """Attempts to set the mapcode based on given latlong tuple (0.00, -0.00)"""
        if not latlong and self.latlong:
            latlong = self.latlong
        elif not latlong and not self.latlong:
            return False

        try:
            self.latlong = latlong
            response = self.mc.encode(latlong[0], latlong[1])
            # Save first element as is most accurate with context
            relevent_mapcode = response[0]
            context = relevent_mapcode[1]
            inner_mapcode = relevent_mapcode[0]
            self.mapcode = f"{context} {inner_mapcode}"
            return True
        except Exception as e:
            logger = logging.getLogger(__name__)
            logger.warning(f"Failed to encode latlong {latlong} -> mapcode: {e}")
            return False

    def set_latlong(self, mapcode: str) -> bool:
        if not mapcode and self.mapcode:
            mapcode = self.mapcode
        elif not mapcode and not self.mapcode:
            return False
        
        try:
            self.mapcode = mapcode
            self.latlong = self.mc.decode(mapcode)
            return True
        except Exception as e:
            logger = logging.getLogger(__name__)
            logger.warning(f"Failed to decode mapcode {mapcode} -> latlong: {e}")
            return False
