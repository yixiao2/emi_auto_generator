function out_varpar = compute_clm_varpar(dim_name)

out_varpar = '';

switch dim_name
    case 'begg'
    case 'endg'
    case 'begl'
    case 'endl'
    case 'begc'
    case 'endc'
    case 'begp'
    case 'endp'
    case '-nlevsno'
        out_varpar = 'nlevsno';
    case {'-nlevsno + 1','-nlevsno+1'}
        out_varpar = 'nlevsno';
    case 'nlevsoi'
        out_varpar = 'nlevsoi';
    case 'nlevgrnd'
        out_varpar = 'nlevgrnd';
    case '0'
    case '1'
    case '2'
    case {'endc - begc + 1','endc-begc+1'}
    case {'nlevdecomp_full'}
        out_varpar = 'nlevdecomp_full';
    case {'ndecomp_pools'}
        out_varpar = 'ndecomp_pools';
    otherwise
        error(['Unsupported dimension name: ' inp_dim_name]);
end
