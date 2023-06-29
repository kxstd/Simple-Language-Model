csv_path='./result_best_.csv'

# model_set=("RNN_TANH" "RNN_RELU" "LSTM" "GRU" "Transformer")

model_set=("LSTM")

emsize_set=(100 200 300)

nhid_set=(1300 1500 2000)

nlayers_set=(1)

lr_set=(20)

batch_size_set=(128)

nhead_set=(1)

epochs=40

dropout_set=(0.65)

# dropout_set=(0.65)
python csv_init.py --path ${csv_path}

for model in ${model_set[*]}
    do
    for emsize in ${emsize_set[*]}
        do
        for nhid in ${nhid_set[*]}
            do
            for nlayers in ${nlayers_set[*]}
                do
                for lr in ${lr_set[*]}
                    do
                    for batch_size in ${batch_size_set[*]}
                        do
                        for nhead in ${nhead_set[*]} 
                            do
                            for dropout in ${dropout_set[*]}
                                do
                                python main.py --data data/gigaspeech --cuda  --model $model --emsize $emsize  --nhid $nhid --nlayers $nlayers --lr $lr --batch_size $batch_size --nhead $nhead --save save/best_emsize${emsize}_nhid${nhid}_dropout${dropout} --epochs $epochs --dropout ${dropout} --csv_path ${csv_path}
                                done
                            done
                        done
                    done
                done
            done
        done
    done

