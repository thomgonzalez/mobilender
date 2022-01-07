from django.db.models.query import QuerySet
from rest_framework import viewsets
from rest_framework import status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.decorators import permission_classes

from shop.models import Order, OrderDetail, Delivery

from .serializers import OrderSerializer, OrderFormSerializer, OrderDetailSerializer
from .filters import OrderFilter


def get_data(queryset, **kwargs):
	data = []
	if kwargs.get('is_urgent') and kwargs.get('client_type') \
		and kwargs.get('distribution') and kwargs.get('is_assortment'):

		if kwargs.get('is_urgent') == '1' and kwargs.get('client_type') == '04'  \
			and kwargs.get('distribution') == 'all' and kwargs.get('is_assortment') == '0':

			orders = queryset.filter(
				is_urgent=int(kwargs.get('is_urgent')), 
				customer__client_type=kwargs.get('client_type'),
				company__isnull=True, 
				branch__isnull=True
			)
			pks = list(orders.values_list('pk', flat=True))
			data = OrderDetail.objects.filter(pk__in=pks, assortment_date__isnull=True)
	else:
		pks = list(queryset.values_list('pk', flat=True))
		data = OrderDetail.objects.filter(pk__in=pks)
	return data

@permission_classes((AllowAny,))
class OrderViewSet(viewsets.GenericViewSet):
	queryset = Order.objects.all()
	serializer_class = OrderDetailSerializer
	#filterset_class = OrderFilter
	permission_classes = (IsAuthenticated,)

	def list(self, request):
		kwargs = {
			'is_urgent': self.request.query_params.get('is_urgent', None),
			'client_type': self.request.query_params.get('client_type', None),
			'distribution': self.request.query_params.get('distribution', None),
			'is_assortment': self.request.query_params.get('is_assortment', None)
		}

		queryset = self.filter_queryset(self.get_queryset())
		data = get_data(queryset, **kwargs)
		serializer = self.get_serializer(data, many=True)
		return Response(serializer.data, status=status.HTTP_200_OK)

	def create(self, request):
		data = request.data
		serializer = OrderFormSerializer(data=data)
		serializer.is_valid(raise_exception=True)
		serializer.save()
		return Response(serializer.data, status=status.HTTP_201_CREATED)
