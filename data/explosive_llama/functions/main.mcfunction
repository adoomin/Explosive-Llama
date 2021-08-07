scoreboard objectives add ELExcOnce dummy

#Initial Entity UUID
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:llama_spawn_egg"}},tag=!ELExcOnce] at @s if entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:tnt"}},distance=0..0.5] run summon minecraft:llama ~ ~ ~ {UUID:[I;1029,2938,3847,4756],DecorItem:{id:"minecraft:red_carpet",Count:1b},Attributes:[{Name:generic.knockback_resistance,Base:1.0}]}

#Execute Once
execute as @e[type=minecraft:llama,nbt={UUID:[I;1029,2938,3847,4756]},tag=!ELExcOnce] run tag @s add ExplosiveLlama
scoreboard players add @e[tag=ExplosiveLlama,tag=!ELExcOnce] ELExcOnce 1
execute as @e[tag=ExplosiveLlama,tag=!ELExcOnce] at @s run particle minecraft:firework ~ ~ ~ 0.1 0.1 0.1 0.2 100 normal
execute as @e[tag=ExplosiveLlama,tag=!ELExcOnce] at @s run playsound minecraft:entity.wither.spawn block @p
execute as @e[tag=ExplosiveLlama,tag=!ELExcOnce] at @s run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:tnt"}},distance=0..0.5]
execute as @e[tag=ExplosiveLlama,tag=!ELExcOnce] at @s run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:llama_spawn_egg"}},distance=0..0.5]

tag @e[scores={ELExcOnce=1..},tag=!ELExcOnce] add ELExcOnce
scoreboard players reset @e[tag=ELExcOnce] ELExcOnce
tag @e[scores={ELExcOnce=0}] remove ELExcOnce

#Loop
execute as @e[tag=ExplosiveLlama] at @s run effect give @s minecraft:resistance 1 255 true
execute as @e[tag=ExplosiveLlama] at @s run effect give @s minecraft:glowing 1 1 true
execute as @e[type=minecraft:llama_spit,nbt={Owner:[I;1029,2938,3847,4756]}] at @s run summon minecraft:tnt ~ ~ ~ {Fuse:0}