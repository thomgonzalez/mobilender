from rest_framework import viewsets
from rest_framework import status
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated

from shop.models import Order

from .serializers import OrderSerializer, OrderFormSerializer


class OrderViewSet(viewsets.GenericViewSet):
	queryset = Order.objects.all()
	serializer_class = OrderSerializer
	permission_classes = (IsAuthenticated,)

	def list(self, request):
		queryset = self.filter_queryset(self.get_queryset())
		serializer = self.get_serializer(queryset, many=True)
		return Response(serializer.data, status=status.HTTP_200_OK)

	def create(self, request):
		data = request.data
		serializer = OrderFormSerializer(data=data)
		serializer.is_valid(raise_exception=True)
		serializer.save()
		return Response(serializer.data, status=status.HTTP_201_CREATED)
