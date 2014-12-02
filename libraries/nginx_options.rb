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
      #
      def self.options(map, indentation = 0)
        # prep
        indent = '  ' * indentation

        # if the user supplies an array of something,
        # process each entry as a separate options element
        # and join them
        if map.is_a? Array
          return map.map do |x|
            options(x, indentation)
          end.join('')
        end

        return '' unless map.is_a? Hash

        # handle hashes by associating their keys/values in nginx
        indent +
          map.map do |k, v|
            if v.is_a? Hash
              # treat it as a new group and process the child hash
              # in a separate options run
              "#{k} {\n" + options(v, indentation + 1) + "}\n"
            elsif v.is_a? Array
              # treat it as multiple calls to the same element
              v.map { |x| "#{k} #{x};\n" }.join(indent)
            else
              # for anything else, just join it up
              "#{k} #{v};\n"
            end
          end.join(indent)
      end
      #
    end
  end
end
