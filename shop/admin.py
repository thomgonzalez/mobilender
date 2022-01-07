from django.contrib import admin
from shop.models import (
    Article, 
    Distribution, 
    Branch,
    Company,
    Order,
    OrderDetail,
    Delivery
)

# Register your models here.

admin.site.register(Article)
admin.site.register(Distribution)
admin.site.register(Branch)
admin.site.register(Company)
admin.site.register(Order)
admin.site.register(OrderDetail)
admin.site.register(Delivery)
