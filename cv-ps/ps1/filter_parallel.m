function peaks = filter_parallel(peaks, rho, theta)
    peaks_len = size(peaks, 1);
    m = zeros(1, peaks_len);
    del_list = zeros(peaks_len);
    del_size = 0;
    for i = 1:peaks_len
        idx = peaks(i, :);
        r = rho(idx(1));
        t = theta(idx(2));
        x0 = r * cosd(t);
        y0 = r * sind(t);
        x1 = x0 - 1000 * sind(t);
        y1 = y0 + 1000 * cosd(t);
        x2 = x0 + 1000 * sind(t);
        y2 = y0 - 1000 * cosd(t);
        m(i) = (y2 - y1) / (x2 - x1);
    end
    for i = 1:peaks_len
        mm = m(i);
        temp = m;
        temp(i) = [];
        if (isempty(temp(temp-mm<0.1)))
            del_size = del_size + 1;
            del_list(del_size) = i;        
        end
    end    
    if (del_size > 0)
        del_list = del_list(1:del_size);
        peaks(del_list,:) = [];
    end        
end