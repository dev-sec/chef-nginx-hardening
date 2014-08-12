# encoding: utf-8
#
# Cookbook Name:: nginx-hardening
# Library:: nginx_options
#
# Copyright 2014, Dominik Richter
# Copyright 2014, Deutsche Telekom AG
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

class Chef
  class Recipe
    class NginxHardening

      def self.options( map, indentation = 0 )

        if map.kind_of? Array
          return map.map{|x|
            self.options(x, indentation)}.join("")
        end

        return "" unless map.kind_of? Hash

        indent = "  "*indentation
        indentnl = indent + "\n"

        indent +
        map.map do |k,v|
          if v.kind_of? Hash
            "#{k} {\n" + self.options(v, indentation + 1) + "}\n"
          else
            "#{k} #{v};\n"
          end
        end.join(indentnl)

      end

    end
  end
end
