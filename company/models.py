from django.db import models


class ClassBaseModel(models.Model):
    status = models.BooleanField(default=True)
    created = models.DateTimeField(auto_now_add=True, editable=False)
    modified = models.DateTimeField(auto_now=True)
    class Meta:
        abstract = True


# Create your models here.
class Supplier(ClassBaseModel):
	name = models.CharField(max_length=100, null=True, help_text='Razón social.')
	address = models.CharField(max_length=300, null=True, help_text='Dirección')

	def __str__(self):
		return '{}'.format(self.name)

	def save(self):
		self.name = self.name.upper()
		super(Supplier, self).save()
	
	class Meta:
		verbose_name_plural = "Suppliers"


class Customer(ClassBaseModel):
	"""Clientes."""
	CLIENT_TYPE_CHOICES = (
		('01', 'NORMAL'),
		('02', 'PLATA'),
		('03', 'ORO'),
		('04', 'PLATINO'),
	)
	code = models.CharField(max_length=20, unique=True)
	client_type = models.CharField(
		max_length=2, choices=CLIENT_TYPE_CHOICES, 
		default='01', help_text='Catalogo tipos de cliente.')
	name = models.CharField(max_length=100, null=True, help_text='Razón social.')
	rfc = models.CharField(max_length=13, help_text='Registro federal de contribuyentes.')
	logo = models.ImageField(null=True, blank=True, help_text='Ruta imagen.')
	address = models.CharField(max_length=300, null=True, help_text='Dirección')

	def __str__(self):
		return '{} {}'.format(self.code, self.name)

	class Meta:
		unique_together = ('code',)
		verbose_name_plural = "Customers"
