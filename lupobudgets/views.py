from django.contrib.auth.decorators import login_required
from django.shortcuts import render, get_object_or_404
from .models import Category, SubCategory

def index(request):
    return render(request, "lupobudgets/index.html")

@login_required
def categories(request):
    categories = Category.objects.all()
    subcategories_universal = SubCategory.objects.filter(user__isnull=True)
    subcategories_user = SubCategory.objects.filter(user=request.user)

    context = {
        "categories": categories,
        "subcategories_universal": subcategories_universal,
        "subcategories_user": subcategories_user,
    }
    return render(request, "lupobudgets/categories.html", context)

@login_required
def category(request, id: int = 0):
    context = {}
    if id > 0:
        category = get_object_or_404(SubCategory, pk=id)
        context["category"] = category
    return render(request, "lupobudgets/category.html", context)
