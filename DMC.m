classdef DMC < handle
    
    properties
        M  % dim (N*ny)x(Nu*nu)
        Mp  % dim (N*ny)x((D-1)*nu)
        K  % dim (Nu*nu)x(N*ny)
        K1 % dim nu x(N*ny)
        dUp % dim ((D - 1)*nu) x 1
        
        D %scalar
        N %scalar
        Nu %scalar
    end
    
    methods
        function obj = DMC(D, N, Nu, lambda, S)
            % S is a cell list (ny x nu), where S(i,j) is a step response u_i to y_j
            nu = 4;
            ny = 2;
            % constructing the S components
            S_arr = {};
            for i =1:D
                temp = zeros(ny,nu);
                for row = 1:ny
                    for col = 1:nu
                        temp_arr = cell2mat(S(row,col)); %not optimal as fricc
                        temp(row,col) = temp_arr(i);
                    end
                end
                S_arr{end+1} = temp;
            end
            
            % constructing the dynamic matrix
            obj.M = cell(N,Nu);
            zero_cell = {zeros(ny,nu)};
            for i = 1:size(obj.M,1)
                for j = 1:size(obj.M,2)
                    obj.M(i,j) = zero_cell;
                end
            end
            
            for i = 1:size(obj.M,1)
                for j = 1:size(obj.M,2)
                    if i>=j
                        obj.M(i,j) = S_arr(i-j+1);
                    end
                end
            end
            obj.M = cell2mat(obj.M);
            
            % constructing the Mp matrix        
            obj.Mp = cell(N,D-1);
            for i = 1:size(obj.Mp,1)
                for j = 1:size(obj.Mp,2)
                    obj.Mp(i,j) = zero_cell;
                end
            end
            
            for i = 1:size(obj.Mp,1)
                for j = 1:size(obj.Mp,2)
                    if i+j<D
                        obj.Mp(i,j) = {cell2mat(S_arr(i+j)) - cell2mat(S_arr(j))};
                    else
                        obj.Mp(i,j) = {cell2mat(S_arr(D)) - cell2mat(S_arr(j))};
                    end
                end
            end
            obj.Mp = cell2mat(obj.Mp);
            
            obj.K = ((obj.M'*obj.M + lambda*eye(Nu*2))^-1)*obj.M';
            obj.K1 = obj.K(1:nu, :);
            
            obj.D = D;
            obj.N = N;
            obj.Nu = Nu;
            
            obj.dUp = zeros((obj.D - 1)*nu, 1);
        end
        
        
        % measurments: transposed vector  1 x ny
        % prev_controls: transposed vector  1 x nu
        % Yzad: transposed vector  1 x ny
        function [controls, err] = eval_controls(obj, measurements, prev_controls, Yzad)
            ny=2;
            nu=4;
            
            e = measurements' - Yzad';
            err =  e.^2;
            
            % creating Y(k) and Yzad(k)
            Y = repmat(measurements', obj.N, 1);
            Yzad_k = repmat(Yzad', obj.N, 1);
            
            % evaluating delta u
            du = obj.K1*(Yzad_k - Y - obj.Mp * obj.dUp);
            
            % sending controls
            controls = prev_controls + du';
            
            % constraints
            if controls(1) > 100
                controls(1) = 100;
            elseif controls(1) < 0
                controls(1) = 0;
            end
            
            if controls(2) > 100
                controls(2) = 100;
            elseif controls(2) < 0
                controls(2) = 0;
            end
            
            temp = [du; obj.dUp];
            obj.dUp = temp(1:(obj.D - 1)*nu);
            

        end
    end
end

