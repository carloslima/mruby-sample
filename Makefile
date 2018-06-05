default: app

mruby-1.4.1.tar.gz:
	wget https://github.com/mruby/mruby/archive/1.4.1.tar.gz -O mruby-1.4.1.tar.gz
mruby: mruby-1.4.1.tar.gz
	tar -axf mruby-1.4.1.tar.gz
	mv mruby-1.4.1 mruby
mruby/bin/mrbc: mruby
	cd mruby && make

generated_bytecode.c: mruby/bin/mrbc app.rb
	mruby/bin/mrbc -Bgenerated_mrb_bytecode -o generated_bytecode.c app.rb
app: app.c generated_bytecode.c
	gcc -std=c99 -Imruby/include app.c -o app mruby/build/host/lib/libmruby.a -lm
	strip app
clean:
	cd mruby && make clean
	rm -f generated_bytecode.c app

.PHONY: clean
