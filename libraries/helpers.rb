#
# Cookbook Name:: wordpress_windows
# Library:: random_string
# Author:: Yvo van Doorn <yvo@opscode.com>
#
# Copyright 2013, Opscode, Inc.
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

module Wordpress
  module Helpers
    def random_wpdbprefix_string
      randostring = String.new
      
      while randostring.length < 10
        randostring << "wp_"
        randostring << (0...6).map{ ('a'..'z').to_a[rand(26)] }.join
        randostring << "_"
      end

      randostring
    end

    def is_local_host?(host)
      require 'socket'
      require 'resolv'
      Socket.ip_address_list.map { |a| a.ip_address }.include? Resolv.getaddress host
    end
  end
end
