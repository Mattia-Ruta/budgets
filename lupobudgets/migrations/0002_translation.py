# Generated by Django 4.2.4 on 2023-09-19 19:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('lupobudgets', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Translation',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('key', models.CharField(max_length=64)),
                ('lang', models.CharField(max_length=2)),
                ('translation', models.CharField(max_length=255)),
            ],
        ),
    ]