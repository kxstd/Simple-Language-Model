csv_path='./result4.csv'

# model_set=("RNN_TANH" "RNN_RELU" "LSTM" "GRU" "Transformer")

model_set=("GRU")

emsize_set=(100 150 200 250 300)

nhid_set=(100 150 250 300)

nlayers_set=(1 3 4 5)

lr_set=(10 15 25 30)

batch_size_set=(8 16 64 128)

nhead_set=(1 4 8 16)

epochs=10


python csv_init.py --path ${csv_path}

for model in ${model_set[*]}
    do
    # for emsize in ${emsize_set[*]}
    #     do
    #     python main.py --data data/gigaspeech --cuda  --model $model --emsize $emsize --save save/${model}_emsize_${emsize} --epochs $epochs --csv_path ${csv_path}
    #     done

    # for nhid in ${nhid_set[*]}
    #     do
    #     python main.py --data data/gigaspeech --cuda  --model $model --nhid $nhid --save save/${model}_nhid_${nhid} --epochs $epochs  --csv_path ${csv_path}
    #     done

    # for nlayers in ${nlayers_set[*]}
    #     do
    #     python main.py --data data/gigaspeech --cuda  --model $model --nlayers $nlayers --save save/${model}_nlayers_${nlayers} --epochs $epochs --csv_path ${csv_path}
    #     done

    # for lr in ${lr_set[*]}
    #     do
    #     python main.py --data data/gigaspeech --cuda  --model $model --lr $lr --save save/${model}_lr_${lr} --epochs $epochs --csv_path ${csv_path}
    #     done

    for batch_size in ${batch_size_set[*]}
        do
        python main.py --data data/gigaspeech --cuda  --model $model --batch_size $batch_size --save save/${model}_batch_size_${batch_size} --epochs $epochs --csv_path ${csv_path}
        done

    if test $model == "Transformer"
        then
        for nhead in ${nhead_set[*]}
        do
        python main.py --data data/gigaspeech --cuda  --model $model --save save/${model}_nhead_${nhead} --nhead $nhead --epochs $epochs --csv_path ${csv_path}
        done
        fi
    done
