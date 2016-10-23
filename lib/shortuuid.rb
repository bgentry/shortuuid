require 'shortuuid/version'
require 'radix'

module ShortUUID
  def self.shorten(uuid, alphabet = Radix::BASE::B62)
    return nil unless uuid && !uuid.empty?
    uuid.delete('-').to_i(16).b(10).to_s(alphabet)
  end

  def self.expand(short_uuid, alphabet = Radix::BASE::B62)
    return nil unless short_uuid && !short_uuid.empty?
    uuid = short_uuid.b(alphabet).to_i.to_s(16).rjust(32, '0')
    [
      uuid[0..7],
      uuid[8..11],
      uuid[12..15],
      uuid[16..19],
      uuid[20..31]
    ].join('-')
  end
end
