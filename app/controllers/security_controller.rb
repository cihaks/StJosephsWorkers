class SecurityController < ApplicationController
  require_role :admin
end
