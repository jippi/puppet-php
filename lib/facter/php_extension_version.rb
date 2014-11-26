Facter.add(:php_extension_version) do
  confine :kernel => :linux
  setcode do
    version = Facter::Util::Resolution.exec('/usr/bin/env php -i | grep "PHP Extension =" | cut -d " " -f 4 2> /dev/null')
    if version
      version
    else
      nil
    end
  end
end
