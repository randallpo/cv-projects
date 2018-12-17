function peaks = filter_lines(peaks, rho, theta, t_rho, t_theta)
    peaks_len = size(peaks, 1);
    del_list = zeros(1, peaks_len);
    del_size = 0;
    for i = 1:peaks_len
        delta_rho = abs(rho(peaks(:, 1)) - rho(peaks(i, 1)));
        delta_theta = abs(theta(peaks(:, 2)) - theta(peaks(i, 2)));
        f_theta = length(delta_theta(delta_theta > t_theta));
        f_rho = length(delta_rho(delta_rho > 1 & delta_rho < t_rho));
        if not (f_theta > 0 && f_rho > 0)
            del_size = del_size + 1;
            del_list(del_size) = i;
        end
    end
    if (del_size > 0)
        del_list = del_list(1:del_size);
        peaks(del_list,:) = [];
    end
end