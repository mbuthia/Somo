# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import os
from django.conf import settings
from datetime import datetime

from django.contrib import messages
from django.contrib.auth import logout, authenticate, login
from django.contrib.auth.decorators import login_required

from django.contrib.auth.models import User
from django.http import Http404

from django.http import HttpResponse
from django.http import HttpResponseRedirect
from django.shortcuts import render, redirect

# Create your views here.
from django.core.urlresolvers import reverse


from somo.form import RegisterForm, LoginForm, ProfileForm, PasswordForm, UploadForm
from somo.models import UserAccount, Book


def check_auth(request):
    if User.is_authenticated:
        logout_d(request)


def register(request):
    check_auth(request)
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            firstname = form.cleaned_data.get('firstname')
            lastname = form.cleaned_data.get('lastname')
            username = form.cleaned_data.get('username')
            email = form.cleaned_data.get('email')
            password = form.cleaned_data.get('password')
            confirm = form.cleaned_data.get('confirm')

            user = User.objects.filter(email=email).count()
            if user>0:
                messages.add_message(request,messages.INFO, 'The email address exists ')
                return HttpResponseRedirect(reverse('register'))
            else:
                if password == confirm:
                    # assign data to model
                    user = User(
                        email=email,
                        first_name = firstname,
                        last_name = lastname,
                        password=password,
                        username = username,
                        last_login=datetime.now()
                    )
                    if len(password) < 8:
                        messages.add_message(request, messages.INFO, 'password must be atleast 8 characters')
                        return  HttpResponseRedirect(reverse('register'))
                    else:
                        # hash password
                        user.set_password(password)
                        # save data
                        user.save()
                        # redirect
                        messages.add_message(request, messages.INFO, 'created successfully')
                        return HttpResponseRedirect(reverse('login'))
                else:
                    messages.add_message(request,messages.INFO,'password did not match')
                    return HttpResponseRedirect(reverse('register'))

    else:
        form = RegisterForm()
    return render(request,'register.html',{'form':form})


def login_d(request):
    check_auth(request)
    form = LoginForm(request.POST or None)
    if form.is_valid():
        # get form data
        password = request.POST['password']
        email = request.POST['email']
        # check existence of the email
        try:
            user = User.objects.get(email=email)
            user = authenticate(username=user, password=password)

            if user is not None:
                if user.is_active:
                    login(request, user)

                    return HttpResponseRedirect(reverse('profile'))
                else:
                    messages.add_message(request, messages.INFO, 'Your account is not active')
                    return  HttpResponseRedirect(reverse('register'))
            else:
                messages.add_message(request, messages.INFO, 'You provided wrong password')
                return HttpResponseRedirect(reverse('login'))
                # return render(request,'login.html',{'message':'Please check you login credentials'})
        except User.DoesNotExist:
            messages.add_message(request, messages.INFO, 'Your account does not exist')
            return  HttpResponseRedirect(reverse('register'))
    return render(request, 'login.html', {'form': form})


def logout_d(request):
    logout(request)
    return HttpResponseRedirect(reverse('login'))

@login_required
def profile(request):
    current_user = request.user
    user_account = UserAccount.objects.filter(user_id=current_user.id)
    if user_account.count() > 0:
        user_account = UserAccount.objects.filter(user_id=current_user.id).first()
        if (user_account.profile == 1):
            return HttpResponseRedirect(reverse('books'))
    if request.method == 'POST':
        form_profile = ProfileForm(request.POST)
        if form_profile.is_valid():
                lastname = form_profile.cleaned_data.get('lastname')
                firstname = form_profile.cleaned_data.get('firstname')
                user_model = User.objects.filter(username=current_user.username).first()
                user_model.first_name = firstname
                user_model.last_name = lastname
                user_model.save()
###########################################################################################################
                mobile = form_profile.cleaned_data.get('mobile')
                reg = form_profile.cleaned_data.get('reg')
                user_acc = UserAccount.objects.filter(user_id=current_user.id)
                if user_acc.count()>0:
                    user_acc = UserAccount.objects.filter(user_id=current_user.id).first()
                    user_acc.mobile=mobile
                    user_acc.reg=reg
                    user_acc.profile=1
                else:
                    #create
                    user_acc= UserAccount(

                        mobile=mobile,
                        reg=reg,
                        user_id=current_user.id,
                        profile=1

                    )


                user_acc.save()
                return HttpResponseRedirect(reverse('register'))
                messages.add_message(request, messages.INFO, 'update done successfully ')

    else:
        form_password=PasswordForm()
        form_profile = ProfileForm()

    return render(request,'profile.html',{'form':form_profile,
                                       'form_password':form_password })


def book(request):
    books = Book.objects.all()
    return render(request,'book.html',{'books':books})


def myDownload(request):
    books = Book.objects.all()
    return render(request,'download.html',{'books':books})




def myUpload(request):
    current_user = request.user

    if request.method == 'POST':
        formupload = UploadForm(request.POST,request.FILES)
        if formupload.is_valid():
            title = formupload.cleaned_data.get('title')
            description = formupload.cleaned_data.get('description')
            year = formupload.cleaned_data.get('year')
            semester = formupload.cleaned_data.get('semester')
            upload = formupload.cleaned_data.get('document')
            print(upload)
            book = Book(
                user_id = current_user.id,
                title = title,
                description = description,
                year = year,
                semester = semester,
                document = upload,
            )
            book.save()
            messages.add_message(request,messages.INFO,'uploaded')
            return HttpResponseRedirect(reverse('books'))

    else:
        formupload = UploadForm()
    return render(request,'upload.html',{'formupload':formupload})


def details(request,id):
    try:
        books = Book.objects.get(id=id)
    except Book.DoesNotExist:
        raise Http404('Book does not exist')
    return render(request,'detail.html',{'books':books})


def change(request):
    current_user=request.user
    if request.method == 'POST':
        form_password = PasswordForm(request.POST)
        if form_password.is_valid():

            new = form_password.cleaned_data.get('new_pass')
            confirm = form_password.cleaned_data.get('new_password')
            if new !=confirm:
                messages.add_message(request,messages.INFO,'password does not match')
                return HttpResponseRedirect(reverse('change'))

            else:
                user_model = User.objects.filter(username=current_user.username).first()
                if len(new) < 8:
                    messages.add_message(request, messages.INFO, 'password must be atleast 8 characters')
                    return HttpResponseRedirect(reverse('change'))
                else:
                    user_model.set_password(new)
                    user_model.save()

                    messages.add_message(request, messages.INFO, 'Password Change Successfully')
                    return HttpResponseRedirect(reverse('login'))

    else:
        form_password =PasswordForm()
    return render(request,'change.html',{'form_password':form_password})


def home(request):
    return render(request,'home.html',{})