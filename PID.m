classdef PID < handle
    
    properties
       r0
       r1
       r2
       prev_e
    end
    
    methods
        function obj = PID(T, K, Ti, Td)
            obj.r0 = K + (Ti*T)/2 + Td/T;
            obj.r1 = -K + (Ti*T)/2 - (2*Td)/T;
            obj.r2 = Td/T;
            obj.prev_e = [0, 0];
        end
        
        
        function [u, err] = eval_controls(obj, measurements, prev_u, Yzad)
            
            e = Yzad - measurements;
            err =  e.^2;
            
            u = obj.r0*e + obj.r1*obj.prev_e(1) + obj.r2*obj.prev_e(2) + prev_u;
            
            obj.prev_e = [e, obj.prev_e(1)];
        end
    end
end

