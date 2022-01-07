from rest_framework import serializers
from rest_framework.exceptions import ValidationError
from shop.models import (
	Branch, Order, Branch, OrderDetail,
	Article, Distribution, Company
)
from company.models import Customer
from shop.actions import OrderAction, OrderDetailAction


class ArticleSerializer(serializers.ModelSerializer):
	
	class Meta:
		model = Article
		fields = ('id', 'code', 'title', 'supplier')


class CustomerSerializer(serializers.ModelSerializer):
	
	class Meta:
		model = Customer
		fields = ('id', 'code', 'name', 'client_type')


class OrderSerializer(serializers.ModelSerializer):
	customer = CustomerSerializer()

	class Meta:
		model = Order
		fields = '__all__'
		depth = 1


class OrderDetailSerializer(serializers.ModelSerializer):
	order = OrderSerializer()
	article = ArticleSerializer()
	
	class Meta:
		model = OrderDetail
		fields = '__all__'


class OrderFormSerializer(serializers.Serializer):
	customer = serializers.PrimaryKeyRelatedField(queryset=Customer.objects.all())
	branch = serializers.PrimaryKeyRelatedField(
		queryset=Branch.objects.all(), required=False,
		allow_null=True)
	distribution = serializers.PrimaryKeyRelatedField(
		queryset=Distribution.objects.all(), required=False,
		allow_null=True)
	company = serializers.PrimaryKeyRelatedField(
		queryset=Company.objects.all(), required=False,
		allow_null=True)
	article = serializers.PrimaryKeyRelatedField(queryset=Article.objects.all())
	order_number = serializers.IntegerField()
	is_urgent = serializers.BooleanField()
	amount = serializers.IntegerField()

	def save(self):
		kwargs = self.validated_data
		order_number = kwargs.get('order_number')

		detail_kwargs= {
			'article': kwargs.pop('article')
		}
		order = None
		action = OrderAction()
		order_model = action.get(**{'order_number': order_number})
		if order_model:
			msg = 'El numero de orden de pedido ya existe {}'.format(order_number)
			raise ValidationError({'detail': [msg]})

		if not order_model:

			if (kwargs.get('branch') is None and kwargs.get('distribution') is None
				and kwargs.get('company') is None):
				msg = 'Seleccione al menos un tipo de pedido hacia un Sucursal, '
				msg += 'Centro de distribución o a una compañía asociada'
				raise ValidationError({'detail': [msg]})
			
			if (kwargs.get('branch') and kwargs.get('distribution') and kwargs.get('company')):
				msg = 'Solo se puede realizar un tipo de pedido hacia un Sucursal, '
				msg += 'Centro de distribución o a una compañía asociada'
				raise ValidationError({'detail': [msg]})
			
			if (kwargs.get('branch') and kwargs.get('distribution')):
				msg = 'Solo se puede realizar un tipo de pedido hacia un Sucursal, '
				msg += 'Centro de distribución o a una compañía asociada'
				raise ValidationError({'detail': [msg]})
			
			if (kwargs.get('distribution') and kwargs.get('company')):
				msg = 'Solo se puede realizar un tipo de pedido hacia un Sucursal, '
				msg += 'Centro de distribución o a una compañía asociada'
				raise ValidationError({'detail': [msg]})

			if (kwargs.get('branch') and kwargs.get('company')):
				msg = 'Solo se puede realizar un tipo de pedido hacia un Sucursal, '
				msg += 'Centro de distribución o a una compañía asociada'
				raise ValidationError({'detail': [msg]})

			order = action.create(**kwargs)
			detail_kwargs.update({'order': order})
			detail = OrderDetailAction()

			detail.create(**detail_kwargs)
		return order
