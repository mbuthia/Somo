from django.conf import settings
from django.conf.urls import url
from django.views.static import serve

from somo import views

urlpatterns = [
    url(r'^$',views.home,name='home'),
    url(r'^register/$',views.register,name='register'),
    url(r'^login/$',views.login_d,name='login'),
    url(r'^logout/$',views.logout_d,name='logout'),
    url(r'^profile/$',views.profile,name='profile'),
    url(r'^changepassword',views.change,name='change'),
    url(r'^books/$',views.book,name='books'),
    url(r'^download/$',views.myDownload,name='download'),
    url(r'^upload/$',views.myUpload,name='upload'),
    url(r'^(?P<id>[0-9]+)/detail/$',views.details,name='detail')


]
