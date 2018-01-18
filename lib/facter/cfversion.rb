Facter.add(:cfversion) do
  confine :kernel => 'Linux'
  setcode do
    cfversion = Facter::Util::Resolution.exec('cfinfo -version')
    cfversion.match(%r{\d+}) if cfversion
  end
end
