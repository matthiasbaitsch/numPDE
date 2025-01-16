function heat_ke(λ)
    function kefunc(e)
        x = coordinates(e)
        u = x[:, 2] - x[:, 1]
        v = x[:, 3] - x[:, 2]
        w = x[:, 1] - x[:, 3]
        A = 0.5 * (u[1] * v[2] - u[2] * v[1])
        B = 1 / (2 * A) * [
            -v[2] -w[2] -u[2]
             v[1]  w[1]  u[1]
        ]        
        return λ * A * B' * B
    end
    return kefunc
end

function heat_re(w)
    function refunc(e)
        x = coordinates(e)
        u = x[:, 2] - x[:, 1]
        v = x[:, 3] - x[:, 2]
        A = 0.5 * (u[1] * v[2] - u[2] * v[1])
        return w * A / 3 * ones(3)
    end
    return refunc
end

function robin_ke(h)
    function kefunc(e)
        return h * length(e) / 6 * [2 1; 1 2]
    end
    return kefunc
end

function robin_re(h, ts)
    function refunc(e)
        return h * ts * length(e) / 2 * [1; 1]
    end
    return refunc
end

