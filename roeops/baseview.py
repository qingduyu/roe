#coding=utf8
from rest_framework import viewsets
from rest_framework import filters
from rest_framework.pagination import PageNumberPagination
from rest_framework.views import APIView

class DefaultPagination(PageNumberPagination):
    page_size = 10
    page_size_query_param = 'pagesize'
    page_query_param = 'page'
    max_page_size = 1000


from rest_framework.permissions import (
    IsAdminUser,
    IsAuthenticated,
    BasePermission
)


class MyBaseView(APIView):
    permission_classes = (IsAuthenticated,)

    def get(self, request, *args):
        pass

    def post(self, request, *args):
        pass

    def put(self, request, *args):
        pass

    def delete(self, request, *args):
        pass


class MyBaseModelView(viewsets.ModelViewSet):
    queryset = None
    serializer_class = None
    search_fields = []
    permission_classes = []
    pagination_class = DefaultPagination
    filter_backends = [filters.SearchFilter]

    def perform_create(self, serializer):
        serializer.create(self.request.data)

    def perform_update(self, serializer):
        serializer.update(self.get_object(), self.request.data)