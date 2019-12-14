require File.expand_path('../boot', __FILE__)

require 'rails/all'

PUBLIC_KEY = "-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDksts/zS9oINje6lS+6I89SfB0
r9AxifUtOMSjQ/qO0kcHNlevgaV469fcinnbeCBbZnvy0WLdEzU909LRV2aWfom/
7qx0D4qCBkJJE5AFYa8YOEtTxaUuk4qBAUucfVT8rOLv/ewQoBu5DbsQ/qo5ALHg
ivw7RE7FoNFqNk/nZQIDAQAB
-----END PUBLIC KEY-----"

PRIVATE_KEY = "-----BEGIN RSA PRIVATE KEY-----
MIICXgIBAAKBgQDksts/zS9oINje6lS+6I89SfB0r9AxifUtOMSjQ/qO0kcHNlev
gaV469fcinnbeCBbZnvy0WLdEzU909LRV2aWfom/7qx0D4qCBkJJE5AFYa8YOEtT
xaUuk4qBAUucfVT8rOLv/ewQoBu5DbsQ/qo5ALHgivw7RE7FoNFqNk/nZQIDAQAB
AoGBANEgHAzDe84j+ywb61KHJjRNIGwTOLWUCXZIqscAqmVfM0QNFTGPw9hHESTC
G5vsxOnPVRg9D8JIhi77O5Ph8BOCo8d6q1jamfdw44fRaWAqlQFFsPpA1BVblIbc
KkTYGgmXqNNfgvSnDfum9Y9LHL9g9llLvIWTxbo0kw9lCqgBAkEA/jE6DeAvSLk2
Z1jbNSuRGnHSoxPmhubkBKcHqx45gS4/6w2kcAL9cOt7ib7jTtnu7egcwQxkeEWW
fGk+rPnjwQJBAOZTN4Xh0U9vPZAaBaZo49/xQGk5ejk/lJ2Kk3oftm23qdn77vC/
8gbROVv+9Dyg+z4zAxre/Ej2kVl1CW4XHKUCQQC1MGu8Vk/+G5+O/USL2vk8i2Pk
wJuzD0P7mQAbVpkQ3uHK79eFzGvRoNlXb4zhuPDZ/nj4lpfLL3c8SVzWue1BAkAN
AcQP7nm4h6qtWZraE/BSdDhT+Of7FakZ4HqFmgbeWVHhOoX62IwdcHFRzasTRXAK
yiyxtsf+gtYgfCiFLA71AkEArpJmzXYlKcsgsmCQ74CR7CtkmHBBwX/cQGOQVOjU
Q/ADzLuNkQAgzMzPVrkeDulacHGHAm/yUwVbU0VSNSb03A==
-----END RSA PRIVATE KEY-----"

Bundler.require(*Rails.groups)

module Socify
  class Application < Rails::Application
    config.i18n.available_locales = [:en, :da]
    config.i18n.default_locale = :da
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
  end
end
