from rest_framework import viewsets
from rest_framework import status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated

from shop.models import Order, OrderDetail, Delivery

from .serializers import OrderSerializer, OrderFormSerializer, OrderDetailSerializer
from .filters import OrderFilter


class OrderViewSet(viewsets.GenericViewSet):
	queryset = Order.objects.all()
	serializer_class = OrderDetailSerializer
	#filterset_class = OrderFilter
	permission_classes = (IsAuthenticated,)

	def list(self, request):
		is_urgent = self.request.query_params.get('is_urgent', None)
		client_type = self.request.query_params.get('client_type', None)
		distribution = self.request.query_params.get('distribution', None)
		is_assortment = self.request.query_params.get('is_assortment', None)
		print(is_urgent, client_type, distribution, is_assortment)
		
		orders = self.filter_queryset(self.get_queryset())

		if is_urgent == '1' and client_type == '04' and distribution == 'all' and is_assortment == '0':
			orders = orders.filter(
				is_urgent=int(is_urgent), 
				customer__client_type=client_type,
				company__isnull=True, 
				branch__isnull=True
			)
			pks = list(orders.values_list('pk', flat=True))
			queryset = OrderDetail.objects.filter(pk__in=pks, assortment_date__isnull=True)
			print(queryset)

		serializer = self.get_serializer(queryset, many=True)
		return Response(serializer.data, status=status.HTTP_200_OK)

	def create(self, request):
		data = request.data
		serializer = OrderFormSerializer(data=data)
		serializer.is_valid(raise_exception=True)
		serializer.save()
		return Response(serializer.data, status=status.HTTP_201_CREATED)
