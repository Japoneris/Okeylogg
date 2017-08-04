(*Get char whenever key is pressed.
This include backspace, escape, del, enter but not ctrl, fn or alt keys*)
let get1char () =
    let termio = Unix.tcgetattr Unix.stdin in
    let () =
        Unix.tcsetattr Unix.stdin Unix.TCSADRAIN
            { termio with Unix.c_icanon = false } in
    let res = input_char stdin in
    Unix.tcsetattr Unix.stdin Unix.TCSADRAIN termio;
    res
;;


let rec main tx =
  let c = get1char () in
  let ty = Unix.gettimeofday() in
  Printf.printf "%c : %f" c (ty -. tx);
  (*
  In the case of terminal use only :
  Printf.printf "%f" (ty -. tx);
  *)
  print_newline (); (*Flush the buffer + get nicer format*)
  match c with
  | '\027' -> ()
  | _ -> main ty
;;

main (Unix.gettimeofday()) ;;
