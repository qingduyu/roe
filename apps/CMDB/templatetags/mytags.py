# coding: utf-8


from django import template
from utils.encrpt import prpcrypt
register = template.Library()


@register.filter(name='int2str')
def int2str(value):
    """
    int 转换为 str
    """
    return str(value)


@register.filter(name='res_splict')
def res_split(value):
    """
    将结果格式化换行
    """
    res = []
    if isinstance(value, tuple):
        for v in value:
            if v is not None:
                data = v.replace('\n', '<br>')
                res.append(data)
        return res
    else:
        return value

@register.filter(name='jiemi')
def jiemi(value):
    pc=prpcrypt()
    jiemi=pc.decrypt(value)
    return jiemi