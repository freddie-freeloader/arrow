classdef Float64Array < arrow.array.Array
    % arrow.array.Float64Array

    % Licensed to the Apache Software Foundation (ASF) under one or more
    % contributor license agreements.  See the NOTICE file distributed with
    % this work for additional information regarding copyright ownership.
    % The ASF licenses this file to you under the Apache License, Version
    % 2.0 (the "License"); you may not use this file except in compliance
    % with the License.  You may obtain a copy of the License at
    %
    %   http://www.apache.org/licenses/LICENSE-2.0
    %
    % Unless required by applicable law or agreed to in writing, software
    % distributed under the License is distributed on an "AS IS" BASIS,
    % WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
    % implied.  See the License for the specific language governing
    % permissions and limitations under the License.

    properties (Hidden, SetAccess=private)
        MatlabArray
    end

    methods
        function obj = Float64Array(data, opts)
            arguments
                data
                opts.DeepCopy = false
            end

            validateattributes(data, "double", ["2d", "nonsparse", "real"]);
            if ~isempty(data), validateattributes(data, "double", "vector"); end
            obj@arrow.array.Array("Name", "arrow.array.proxy.Float64Array", "ConstructorArguments", {data, opts.DeepCopy});
            % Store a reference to the array if not doing a deep copy
            if (~opts.DeepCopy), obj.MatlabArray = data; end
        end

        function data = double(obj)
            data = obj.Proxy.ToMatlab();
        end
    end
end
