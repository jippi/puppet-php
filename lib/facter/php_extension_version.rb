Facter.add(:php_extension_version) do
  setcode do
    module_api_version = Facter::Util::Resolution.exec("/usr/bin/env php -i 2>/dev/null | awk '/PHP Extension =/{print $4}'")
    if module_api_version
      module_api_version.match(/(\d{8})/).to_s
    else
      "20121212"
    end
  end
end
