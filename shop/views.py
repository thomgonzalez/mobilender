from django.shortcuts import render
from django.views.generic import View
# Create your views here.

class HomeView(View):
	"""
	Index
	"""
	template_name = 'orders.html'

	def get(self, request):
		context = {}
		return render(request, self.template_name, context)
