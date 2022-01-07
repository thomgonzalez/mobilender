from rest_framework import serializers
from shop.models import Branch, Order, Branch, OrderDetail, Article
from company.models import Customer
from shop.actions import OrderAction


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
	branch = serializers.PrimaryKeyRelatedField(queryset=Branch.objects.all())
	order_number = serializers.IntegerField()
	is_urgent = serializers.BooleanField()

	def save(self):
		kwargs = self.validated_data

		action = OrderAction()
		return action.create(**kwargs)