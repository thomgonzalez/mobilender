# Generated by Django 3.2.9 on 2022-01-07 09:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('company', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='customer',
            name='logo',
            field=models.ImageField(blank=True, help_text='Ruta imagen.', null=True, upload_to=''),
        ),
    ]
