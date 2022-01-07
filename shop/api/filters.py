# Django-filter provides a custom FilterSet and filter backend for use with Django REST Framework.
from django_filters import rest_framework as drf_filters

# django-rest-framework-filters
import rest_framework_filters as filters

from ...rh.models import Employee, Person


class PersonFilter(filters.FilterSet):
	class Meta:
		model = Person
		fields = {'rfc': ['exact', 'in', 'startswith']}


class EmployeeFilter(filters.FilterSet):
	person = filters.RelatedFilter(filterset=PersonFilter, field_name='person',
								   queryset=Person.objects.all())
	class Meta:
		model = Employee
		fields = ('empl_number', 'person')

