function assemble_kr(m)
    N = nnodes(m)
    K = zeros(N, N)
    r = zeros(N)

    for e = entities(m)
        I = nodeindices(e)
        hasdata(e, :ke_func) && (K[I, I] += data(e, :ke_func)(e))
        hasdata(e, :re_func) && (r[I] += data(e, :re_func)(e))
    end
    
    return K, r
end
