rng('shuffle');
n = input('Input n : ');
if length(n) == 0
    n=10;
end
volume = rand(n, n);
rate = rand(n, n);

count = 0;
unfilled_count = 0;
for i= 1:n
    for j= 1:n  
        fismat = readfis('Fuzzy');
        out(i, j) = evalfis([volume(i, j) rate(i, j)],fismat);
        if out(i, j) >= 0.5
            final_out(i, j) = 1;
            count = count + 1;
        else 
            final_out(i, j) = 0;
            unfilled_count = unfilled_count + 1;
        end
    end
end

final_out(1,1)=1;
%Initialising matrix to store the coordinates having value 0.
unfilled_locations = zeros(unfilled_count,2);
index = 1;
for i = 1:n
    for j = 1:n
        if final_out(i, j) == 0
            unfilled_locations(index , 1) = i;       %storing the index having value 1
            unfilled_locations(index, 2) = j;
            index = index + 1;
        end
    end
end

plot(unfilled_locations(:,1),unfilled_locations(:,2),'bo')
hold on

%Initialising matrix to store the coordinates having value 1.
locations = zeros(count, 2);

index = 1;
for i = 1:n
    for j = 1:n
        if final_out(i, j) == 1
            locations(index , 1) = i;       %storing the index having value 1
            locations(index, 2) = j;
            index = index + 1;
        end
    end
end

plot(locations(:,1),locations(:,2),'ro');
%count

distances = zeros(index-1);
for count1=1:index-1,
    for count2=1:count1,
        x1 = locations(count1,1);
        y1 = locations(count1,2);
        x2 = locations(count2,1);
        y2 = locations(count2,2);
        distances(count1,count2)=sqrt((x1-x2)^2+(y1-y2)^2);
        distances(count2,count1)=distances(count1,count2);
    end;
end;

userConfig = struct('xy',locations);
% userCOnfig = struct('numIter', 20000);
tsp_ga(userConfig);