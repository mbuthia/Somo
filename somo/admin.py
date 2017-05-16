# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin

# Register your models here.
from somo.models import MyUpload, MyDownload, Book, Course, UserAccount

admin.site.register(MyUpload)
admin.site.register(MyDownload)

admin.site.register(Book)
admin.site.register(Course)
admin.site.register(UserAccount)