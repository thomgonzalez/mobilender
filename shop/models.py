from django.db import models
from company.models import ClassBaseModel, Customer, Supplier

# Create your models here.
class Article(ClassBaseModel):
	"""
	Products
	"""
	supplier = models.ForeignKey(Supplier, on_delete=models.CASCADE)
	code = models.IntegerField()
	title =  models.CharField(max_length=100)
	description =  models.TextField(null=True)
	price = models.FloatField(default=0)

	def __str__(self):
		return '{} {}'.format(self.price, self.title)

	def save(self):
		self.title = self.title.upper()
		super(Article, self).save()

	class Meta:
		verbose_name_plural = "Articles"
		unique_together = ('code',)


class Distribution(models.Model):
	"""
	Centro de distribución.
	"""
	stock = models.CharField(max_length=100, help_text='Almacen.')

	def __str__(self):
		return '{}'.format(self.stock)

	class Meta:
		verbose_name_plural = "Distributions"


class Branch(models.Model):
	"""
	Sucursal.
	"""
	code = models.IntegerField()
	reference = models.CharField(max_length=50, help_text='Almacen.')

	def __str__(self):
		return '{} {}'.format(self.code, self.reference)
	
	class Meta:
		unique_together = ('code',)
		verbose_name_plural = "BranchOffices"


class Company(models.Model):
	"""
	Compañia.
	"""
	code = models.IntegerField(help_text='Código de Socio')
	reference = models.CharField(max_length=50, help_text='Almacen.')
	
	def __str__(self):
		return '{} {}'.format(self.code, self.reference)

	class Meta:
		unique_together = ('code',)
		verbose_name_plural = "Companies"


class Order(models.Model):
	"""
	Pedido
	"""
	customer = models.ForeignKey(Customer, on_delete=models.CASCADE)
	branch = models.ForeignKey(Branch, null=True, blank=True, on_delete=models.CASCADE)
	distribution = models.ForeignKey(Distribution, null=True, blank=True, on_delete=models.CASCADE)
	company = models.ForeignKey(Company, null=True, blank=True, on_delete=models.CASCADE)
	order_number = models.IntegerField()
	is_urgent = models.BooleanField(default=False)
	generated_date = models.DateTimeField(
		auto_now_add=True, editable=False,
		help_text='Fecha y hora en que se generó el pedido.')
	amount = models.IntegerField(help_text='Cantidad solicitada.')

	def __str__(self):
		return '{}'.format(self.order_number)

	class Meta:
		unique_together = ('order_number',)
		verbose_name_plural = "Orders"


class OrderDetail(models.Model):
	"""
	Detalle del pedido
	"""
	order = models.OneToOneField(Order, on_delete=models.CASCADE)
	article = models.ForeignKey(Article, on_delete=models.CASCADE)
	
	def __str__(self):
		return '{} {}'.format(self.order.order_number, self.article.title)

	class Meta:
		unique_together = (('order', 'article'))
		verbose_name_plural = "Order Details"


class Delivery(models.Model):
	"""
	Entrega
	"""
	order_detail = models.ForeignKey(OrderDetail, on_delete=models.CASCADE)
	assorted_date = models.DateTimeField(help_text='Fecha y hora en que se surtió el pedido.')

	def __str__(self):
		return '{}'.format(self.assorted_date)

	class Meta:
		verbose_name_plural = "Deliveries"
