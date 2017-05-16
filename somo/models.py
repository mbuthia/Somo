# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import os

from django.conf import settings
from django.contrib.auth.models import User
from django.db import models

# Create your models here.
from Somo.settings import validate_file


class Course(models.Model):
    name = models.CharField(max_length=80)

    def __str__(self):
        return self.name


class UserAccount(models.Model):
    user = models.ForeignKey(User)
    profile = models.IntegerField(default=0)
    course_id = models.ManyToManyField(Course)
    mobile = models.CharField(max_length=13)
    reg = models.CharField(max_length=50)
    avatar = models.ImageField()
    status = models.IntegerField(default=0)

    def __str__(self):
        return self.mobile


class Book(models.Model):
    user = models.ForeignKey(User)
    title = models.CharField(max_length=80)
    description = models.TextField(max_length=80)
    year = models.CharField(max_length=7)
    semester = models.CharField(max_length=7)
    unit = models.CharField(max_length=80)
    document = models.FileField(upload_to='documents/',validators=[validate_file])


    def __str__(self):
        return self.title


class MyDownload(models.Model):
    user = models.ForeignKey(User)
    book = models.ManyToManyField(Book)
    date = models.CharField(max_length=80)

    def __str__(self):
        return self.book



class MyUpload(models.Model):
    user = models.ForeignKey(User)
    book = models.ForeignKey(Book)


    def __str__(self):
        return self.title