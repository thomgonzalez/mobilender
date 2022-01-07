from rest_framework.exceptions import ValidationError
from .models import Order


class OrderAction(object):
	
	def create(self, **kwargs):
		"""Crear pedido."""
		instance = Order(**kwargs)
		model = instance.save()
		return model

	def filter(self, **kwargs):
		return Order.objects.filter(**kwargs)

	def all(self):
		return Order.objects.all()
