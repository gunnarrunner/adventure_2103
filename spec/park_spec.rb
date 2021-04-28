require './lib/trail'
require './lib/park'


RSpec.describe Park do
  it 'exists' do
    park1 = Park.new('Capitol Reef')

    expect(park1).to be_instance_of(Park)
  end

  it 'can have a name and trails' do
    park1 = Park.new('Capitol Reef')
    trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
    trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})

    expect(park1.name).to eq("Capitol Reef")
    expect(park1.trails).to eq([])
  end

  it 'can add trails' do
    park1 = Park.new('Capitol Reef')
    trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
    trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})

    park1.add_trail(trail1)
    park1.add_trail(trail2)

    expect(park1.trails).to eq([trail1, trail2])
  end

  it 'can add a trail to a different park' do
    park1 = Park.new('Capitol Reef')
    park2 = Park.new('Bryce Canyon')
    trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
    trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
    trail3 = Trail.new({name: 'Tower Bridge', length: '3.0 miles', level: :moderate})

    park2.add_trail(trail3)

    expect(park2.trails).to eq([trail3])
  end

  it 'can give trails shorter than a certain distance' do
    park1 = Park.new('Capitol Reef')
    park2 = Park.new('Bryce Canyon')
    trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
    trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
    trail3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})
    trail4 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
    trail5 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
    trail6 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})

    park1.add_trail(trail1)
    park1.add_trail(trail2)
    park1.add_trail(trail3)
    park2.add_trail(trail4)
    park2.add_trail(trail5)
    park2.add_trail(trail6)

    expect(park1.trails_shorter_than(2.5)).to eq([trail1, trail2])
    expect(park2.trails_shorter_than(2.5)).to eq([])
  end

  it 'can give hikable miles by the park' do
    park1 = Park.new('Capitol Reef')
    park2 = Park.new('Bryce Canyon')
    trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
    trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
    trail3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})
    trail4 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
    trail5 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
    trail6 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})

    park1.add_trail(trail1)
    park1.add_trail(trail2)
    park1.add_trail(trail3)
    park2.add_trail(trail4)
    park2.add_trail(trail5)
    park2.add_trail(trail6)

    expect(park1.hikeable_miles).to eq(7.5)
    expect(park2.hikeable_miles).to eq(16.9)
  end

  it 'can give trails by level' do
    park1 = Park.new('Capitol Reef')
    park2 = Park.new('Bryce Canyon')
    trail1 = Trail.new({name: 'Grand Wash', length: '2.2 miles', level: :easy})
    trail2 = Trail.new({name: 'Cohab Canyon', length: '1.7 miles', level: :moderate})
    trail3 = Trail.new({name: 'Chimney Rock Loop', length: '3.6 miles', level: :strenuous})
    trail4 = Trail.new({name: "Queen's/Navajo Loop", length: '2.9 miles', level: :moderate})
    trail5 = Trail.new({name: 'Rim Trail', length: '11 miles', level: :easy})
    trail6 = Trail.new({name: 'Tower Bridge', length: '3 miles', level: :moderate})

    park1.add_trail(trail1)
    park1.add_trail(trail2)
    park1.add_trail(trail3)
    park2.add_trail(trail4)
    park2.add_trail(trail5)
    park2.add_trail(trail6)

    expected1 = {
                  easy: ["Grand Wash"],
                  moderate: ["Cohab Canyon"],
                  strenuous: ["Chimney Rock Loop"]
                }

    expected2 = {
                  easy: ["Rim Trail"],
                  moderate: ["Queen's/Navajo Loop", "Tower Bridge"]
                }

    expect(park1.trails_by_level).to eq(expected1)
    expect(park2.trails_by_level).to eq(expected2)
  end
end