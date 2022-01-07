# Generated by Django 3.2.9 on 2022-01-07 09:10

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='delivery',
            options={'verbose_name_plural': 'Deliveries'},
        ),
        migrations.AlterModelOptions(
            name='order',
            options={'verbose_name_plural': 'Orders'},
        ),
        migrations.AlterModelOptions(
            name='orderdetail',
            options={'verbose_name_plural': 'Order Details'},
        ),
        migrations.RemoveField(
            model_name='delivery',
            name='assorted_date',
        ),
        migrations.AddField(
            model_name='delivery',
            name='delivery_date',
            field=models.DateTimeField(help_text='Fecha y hora en que se surtió el pedido.', null=True),
        ),
        migrations.AddField(
            model_name='orderdetail',
            name='assortment_date',
            field=models.DateTimeField(help_text='Fecha y hora en que se surtió el pedido.', null=True),
        ),
        migrations.AlterField(
            model_name='order',
            name='branch',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='shop.branch'),
        ),
        migrations.AlterField(
            model_name='order',
            name='company',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='shop.company'),
        ),
        migrations.AlterField(
            model_name='order',
            name='distribution',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='shop.distribution'),
        ),
        migrations.AlterField(
            model_name='orderdetail',
            name='order',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='shop.order'),
        ),
        migrations.AlterUniqueTogether(
            name='order',
            unique_together={('order_number',)},
        ),
    ]
