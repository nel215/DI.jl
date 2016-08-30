using Base.Test
importall DI

type MyType end

binder = Binder()
bind(binder, MyType, MyType())
instance = get(binder, MyType)
@test typeof(instance) == MyType

type A end
type B
    a::A
end

binder = Binder()
a = A()
bind(binder, A, a)
b1 = get(binder, B)
@test typeof(b1) == B
@test b1.a == a
b2 = get(binder, B)
@test b1 != b2
