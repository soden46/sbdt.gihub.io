import {Component, Inject} from '@angular/core';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import {FormGroup, FormControl, FormGroupDirective, NgForm, Validators} from '@angular/forms';
import {ErrorStateMatcher} from '@angular/material/core';

/** Error when invalid control is dirty, touched, or submitted. */
export class MyErrorStateMatcher implements ErrorStateMatcher {
  isErrorState(control: FormControl | null, form: FormGroupDirective | NgForm | null): boolean {
    const isSubmitted = form && form.submitted;
    return !!(control && control.invalid && (control.dirty || control.touched || isSubmitted));
  }
}



export interface DialogData {
  animal: string;
  name: string;
  password: string;
  email: string;

}

/**
 * @title Dialog Overview
 */
@Component({
  selector: 'dialog-overview-example',
  templateUrl: 'dialog-overview-example.html',
  styleUrls: ['dialog-overview-example.css'],
  
})
export class DialogOverviewExample {

  animal: string;
  name: string;
  password: string;
  email: string;
  // variablile per il numero di tracking
  trackingNum="EXAMPLTRACKNUM123456";
    // variabile per il logo del cliente
  clientLogo = "https://c7.uihere.com/files/592/78/429/5bbbff378e8a3.jpg";

  //stato della cosnegna
  deliveryState=4;

  // elenco dei giorni disponibilii
  preselectedDate = "Giovedì 11 dicembre";
  states: string[] = [
"Venerdì 12 dicembre", "Sabato 13 dicembre", "Domenica 14 dicembre", "Lunedì 15 dicembre"
  ];

//inizio della fascia oraria di consegna. DA MODIFICARE CON UNA VARIABILE DI TEMPO 
startWindow= "18:00";
//fine della fasciaoraria di consegna. DA MODIFICARE CON UNA VARIABILE DI TEMPO 
endWindow= "20:00";

//variabile indirizzo di consegna
deliveryAddress= "Piazza Gae Aulenti, 13, Milano"

// variabili per l'ora delle fasce dellaportineria
  moriningHours: string[] = [
"07:00", "07:15", "07:30", "07:45", "08:00", "08:15", "08:30", "08:45", "09:00", "09:15", "09:30", "09:45", "10:00", "10:15", "10:30", "10:45", "11:00", "11:15", "11:30", "11:45", "12:00",
"12:15", "12:30", "12:45", "13:00", "13:15", "13:30", "13:45", "14:00", "14:15", "14:30"
 ];

   afternoonHours: string[] = [
"13:30", "13:45", "14:00", "14:15", "14:30", "14:45", "15:00", "15:15", "15:30", "15:45", "16:00", "16:15", "16:30", "16:45", "17:00", "17:15", "17:30", "17:45", "18:00",
"18:15", "18:30", "18:45", "19:00", "19:15", "19:30", "19:45", "20:00", "20:15", "20:30"
 ];




 chiusoMLu(): void{

 }

  emailFormControl = new FormControl('', [
    Validators.required,
    Validators.email,
  ]);

  matcher = new MyErrorStateMatcher();

  constructor(public dialog: MatDialog) {}

  openDialog(): void {
    const dialogRef = this.dialog.open(DialogOverviewExampleDialog, {
      width: '400px',
      data: {name: this.name, animal: this.animal}
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
      this.animal = result;
    });

  }

     tryFunction(): void {console.log('bella zio')}

    penDialog(): void {
    const dialogRef = this.dialog.open(SignInDialogComponent, {
      width: '400px',
      data: {email: this.email}
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
  
      this.email = result.email 
       this.password = result.password// per estrarre le informazioni dal dialog
      
    
    });
  }

}

@Component({
  selector: 'dialog-overview-example-dialog',
  templateUrl: 'dialog-overview-example-dialog.html',
})
export class DialogOverviewExampleDialog {

  constructor(
    public dialogRef: MatDialogRef<DialogOverviewExampleDialog>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData) {}

  onNoClick(): void {
    this.dialogRef.close();
  }

}

@Component({
  selector: 'app-sign-in-dialog',
  templateUrl: 'sign-in-dialog/sign-in-dialog.component.html',
  styleUrls: [ 'sign-in-dialog/sign-in-dialog.component.css' ]
})
export class SignInDialogComponent implements OnInit {


 

// per gli errori dell'input della mail
  emailFormControl = new FormControl('', [
    Validators.required,
    Validators.email,
  ]);
   constructor(
    public dialogRef: MatDialogRef<SignInDialogComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData) {}

  onNoClick(): void {
    this.dialogRef.close();
  }

  ngOnInit() {
  }

}





/**  Copyright 2019 Google LLC. All Rights Reserved.
    Use of this source code is governed by an MIT-style license that
    can be found in the LICENSE file at http://angular.io/license */