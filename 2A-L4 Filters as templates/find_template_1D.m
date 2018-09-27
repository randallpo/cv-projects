function index = find_template_1D(t, s)
    % TODO: Locate template t in signal s and return index
    % NOTE: Turn off all output from inside the function before submitting!
    c = normxcorr2(t, s);
    [maxValue rawIndex] = max(c);
    index = rawIndex - size(t, 2) + 1;
end