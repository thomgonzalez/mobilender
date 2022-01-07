from django_filters import rest_framework as filters
from shop.models import Order

class OrderFilter(filters.FilterSet):
	is_urgent = filters.BooleanFilter(field_name="is_urgent", lookup_expr='iexact')

	class Meta:
		model = Order
		fields = ('is_urgent',)
