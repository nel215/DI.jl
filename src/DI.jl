module DI

export Binder, bind, get

type Binder
    bindings::Dict
    Binder() = new(Dict())
end

function bind(binder::Binder, key, value)
    binder.bindings[key] = value
end

function get(binder::Binder, key)
    if haskey(binder.bindings, key)
        return binder.bindings[key]
    end
    args = []
    for t in key.types
        arg = get(binder, t)
        if arg == nothing return nothing end
        push!(args, arg)
    end
    return key(args...)
end

end
