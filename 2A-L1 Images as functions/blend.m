% Blend two images
function output = blend(a, b, alpha)
    % TODO: Your code here; finally assign: output = <something>;
    output = (a * alpha) + (1 - alpha) * b;
endfunction