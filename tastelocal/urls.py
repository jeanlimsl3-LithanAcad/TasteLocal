from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.views import LogoutView

from experiences.views import experience_list_api
from users.views import (
    home,
    login_view,
    register_view,
    discovery,
    vendors,
    vendor_page,
    booking,
    vendor_dashboard,
    map_view,
    api_demo,
)

urlpatterns = [
    path('admin/', admin.site.urls),

    path('', home, name='home'),
    path('login/', login_view, name='login'),
    path('register/', register_view, name='register'),
    path('logout/', LogoutView.as_view(next_page='home'), name='logout'),

    path('discover/', discovery, name='discover'),
    path('vendors/', vendors, name='vendors'),
    path('vendor/<int:id>/', vendor_page, name='vendor'),
    path('booking/', booking, name='booking'),
    path('vendor-dashboard/', vendor_dashboard, name='vendor_dashboard'),
    path('map/', map_view, name='map'),

    path('api/experiences/', experience_list_api, name='experience_list_api'),
    path('api-demo/', api_demo, name='api_demo'),

    path('itinerary/', include('itineraries.urls')),
    path('experiences/', include('experiences.urls')),
    path('bookings/', include('bookings.urls')),
    path('reviews/', include('reviews.urls')),
]

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)