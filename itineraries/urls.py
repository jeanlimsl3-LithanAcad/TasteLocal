from django.urls import path
from . import views

urlpatterns = [
    path('', views.itinerary_list, name='itinerary'),
    path('add/<int:experience_id>/', views.add_to_itinerary, name='add_to_itinerary'),
    path('remove/<int:item_id>/', views.remove_from_itinerary, name='remove_from_itinerary'),
]