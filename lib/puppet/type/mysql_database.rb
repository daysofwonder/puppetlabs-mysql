Puppet::Type.newtype(:mysql_database) do
  @doc = <<-PUPPET
    @summary
      Manage a MySQL database.

    @api private
  PUPPET

  ensurable
  apply_to_all

  autorequire(:file) { '/root/.my.cnf' }
  autorequire(:class) { 'mysql::server' }

  newparam(:name, namevar: true) do
    desc 'The name of the MySQL database to manage.'
  end

  newproperty(:charset) do
    desc 'The CHARACTER SET setting for the database'
    defaultto :utf8
    newvalue(%r{^\S+$})
  end

  newproperty(:collate) do
    desc 'The COLLATE setting for the database'
    defaultto :utf8_general_ci
    newvalue(%r{^\S+$})
  end
end
