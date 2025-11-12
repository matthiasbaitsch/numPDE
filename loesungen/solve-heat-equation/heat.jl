heat_re(w::Real) = heat_re(e -> w)
robin_ke(h) = e -> h * length(e) / 6 * [2 1; 1 2]
robin_re(h, ts) = e -> h * ts * length(e) / 2 * ones(2)
heat_me(ρ, c) = e -> area(e) * ρ * c / 12 * [2 1 1; 1 2 1; 1 1 2]

function heat_ke(λ)
    function kefunc(e)
        x = coordinates(e)
        u = x[:, 2] - x[:, 1]
        v = x[:, 3] - x[:, 2]
        w = x[:, 1] - x[:, 3]
        A = 0.5 * (u[1] * v[2] - u[2] * v[1])
        B = 1 / (2 * A) * [
            -v[2] -w[2] -u[2]
            v[1] w[1] u[1]
        ]
        return λ * A * B' * B
    end
    return kefunc
end

function heat_re(w)
    refunc(e::Edge) = w(e) * length(e) / 2 * ones(2)
    refunc(e::Face) = w(e) * area(e) / 3 * ones(3)
    return refunc
end;
